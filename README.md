# AWS OpsWorks PHP Cookbooks.
# Summary
> "OpsWorks is a DevOps solution for managing the complete application lifecycle, including resource provisioning, configuration management, application deployment software updates, monitoring and access control."

This repository contains a small collection of recipes to help setup applications in OpsWorks.

Supports Chef 11.10

# Requirements
- Ubuntu Instances.
- Apache2.
- mod_env must be enabled.

# Installation
- In your OpsWorks stack settings enable **"Use custom Chef Cookbooks"**
- Select **"Repository type"** = Git (or any repository you choose to use)
- **"Repository URL"** use git@github.com:TeamSymfony/opswork-chef-cookbooks.git.
- Set the SSH key if you have one, if not this can be left blank as long as the repo is public.
- Depending on what recipes you use you may need to set a Custom Chef JSON.

# MIT LICENSE
Copyright (c) 2013 TeamSymfony

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
