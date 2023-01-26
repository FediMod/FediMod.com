FROM klakegg/hugo:ext-ubuntu

WORKDIR ./
COPY . /src

ENV HUGO_ENV=production

# Base URL
ARG HUGO_BASEURL=/
ENV HUGO_BASEURL=${HUGO_BASEURL}

# Module Proxy
ARG HUGO_MODULE_PROXY=
ENV HUGO_MODULE_PROXY=${HUGO_MODULE_PROXY}

# NPM mirrors, such as https://registry.npmmirror.com
ARG NPM_CONFIG_REGISTRY=
ENV NPM_CONFIG_REGISTRY=${NPM_CONFIG_REGISTRY}

# Install dependencies
RUN npm install
RUN npm install -g @fullhuman/postcss-purgecss rtlcss

# Build site
RUN hugo --minify --gc --enableGitInfo
