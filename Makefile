# Python virtual env
ENV_NAME = .venv

# Prefix command to execute Python code from 
virtualenv
ENV_ACT = . env/bin/activate &&

# Shortcut to invoke the nikola command line 
interface from virtualenv
NIKOLA = $(ENV_ACT) cd $(BLOG_DIR) && nikola

# Source of site
BLOG_DIR = ~/Public/git/venblog

# Build output for site
OUTPUT_DIR = $(BLOG_DIR)/output

# Staging folder for built site
STAGING_DIR = $(BLOG_DIR)/output

# Github Page remote
ORIGIN = 
git@github.com:telectricsee/telectricsee.github.io.git

# Website domain (used for CNAME file)
DOMAIN = www.twohourslate.com
