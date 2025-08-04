# docker-lambda

Docker Lambda runtime emulator for local development and testing of AWS Lambda functions.

This project is based on [mLupine/docker-lambda](https://github.com/mLupine/docker-lambda), a maintained fork of the original LambCI project that provides sandboxed local environments that replicate the live AWS Lambda environment almost identically.

## Available Runtimes

### Python Runtimes
- **Python 3.8**: `javiortizmol/docker-lambda:python3.8-x86_64` ✅ *Uses official AWS Lambda Python 3.8*
- **Python 3.9**: `javiortizmol/docker-lambda:python3.9-x86_64` ✅ *Uses official AWS Lambda Python 3.9*
- **Python 3.10**: `javiortizmol/docker-lambda:python3.10-x86_64` ✅ *Uses official AWS Lambda Python 3.10*
- **Python 3.11**: `javiortizmol/docker-lambda:python3.11-x86_64` ✅ *Uses official AWS Lambda Python 3.11*
- **Python 3.12**: `javiortizmol/docker-lambda:python3.12-x86_64` ✅ *Uses official AWS Lambda Python 3.12*

### Custom Runtime
- **Provided.al2**: `javiortizmol/docker-lambda:provided.al2-x86_64`

## Build Environments

Each runtime also has a corresponding build environment with development tools:
- `javiortizmol/docker-lambda:python3.8-build-x86_64` ✅ *Includes development tools*
- `javiortizmol/docker-lambda:python3.9-build-x86_64` ✅ *Includes development tools*
- `javiortizmol/docker-lambda:python3.10-build-x86_64` ✅ *Includes development tools*
- `javiortizmol/docker-lambda:python3.11-build-x86_64` ✅ *Includes development tools*
- `javiortizmol/docker-lambda:python3.12-build-x86_64` ✅ *Includes development tools*
- `javiortizmol/docker-lambda:provided.al2-build-x86_64`

## Usage

### Running Lambda Functions Locally
```bash
# Python 3.8
docker run -v $(pwd):/var/task javiortizmol/docker-lambda:python3.8-x86_64 handler.handler

# Python 3.9
docker run -v $(pwd):/var/task javiortizmol/docker-lambda:python3.9-x86_64 handler.handler

# Python 3.10
docker run -v $(pwd):/var/task javiortizmol/docker-lambda:python3.10-x86_64 handler.handler

# Python 3.11
docker run -v $(pwd):/var/task javiortizmol/docker-lambda:python3.11-x86_64 handler.handler

# Python 3.12
docker run -v $(pwd):/var/task javiortizmol/docker-lambda:python3.12-x86_64 handler.handler
```

### Building Lambda Functions
```bash
# Python 3.8 build environment
docker run -v $(pwd):/var/task javiortizmol/docker-lambda:python3.8-build-x86_64

# Python 3.9 build environment
docker run -v $(pwd):/var/task javiortizmol/docker-lambda:python3.9-build-x86_64

# Python 3.10 build environment
docker run -v $(pwd):/var/task javiortizmol/docker-lambda:python3.10-build-x86_64

# Python 3.11 build environment
docker run -v $(pwd):/var/task javiortizmol/docker-lambda:python3.11-build-x86_64

# Python 3.12 build environment
docker run -v $(pwd):/var/task javiortizmol/docker-lambda:python3.12-build-x86_64

# Install dependencies
docker run -v $(pwd):/var/task javiortizmol/docker-lambda:python3.12-build-x86_64 python3.12 -m pip install -r requirements.txt

### Serverless Framework Integration

For Serverless Framework users, you can use the [serverless-python-requirements](https://github.com/UnitedIncome/serverless-python-requirements) plugin to automatically build your Python dependencies using these Docker images:

```yaml
# serverless.yml
plugins:
  - serverless-python-requirements

custom:
  pythonRequirements:
    dockerizePip: true
    dockerImage: javiortizmol/docker-lambda:python3.12-build-x86_64
    # Or use other Python versions:
    # dockerImage: javiortizmol/docker-lambda:python3.11-build-x86_64
    # dockerImage: javiortizmol/docker-lambda:python3.10-build-x86_64
    # dockerImage: javiortizmol/docker-lambda:python3.9-build-x86_64
    # dockerImage: javiortizmol/docker-lambda:python3.8-build-x86_64
```

## Building All Images

```bash
./build-all.sh
```

## Pushing All Images

```bash
./push-all.sh
```

## Python Runtimes Implementation

✅ **All Python runtimes (3.8-3.12) are now fully supported** using the official AWS Lambda Python images from ECR Public.

### Features:
- **Official AWS Images**: Uses `public.ecr.aws/lambda/python:3.X` as base for all versions
- **Real Python Versions**: No more workarounds or fallbacks
- **SSL Support**: Built-in SSL support from AWS images
- **Development Tools**: Build environments include:
  - `pipx`, `virtualenv`, `pipenv`, `poetry`
  - `awscli`, `aws-lambda-builders`, `aws-sam-cli`
  - `gcc`, `make`, `git`, `wget`, and other build tools

### Architecture:
- **Runtime Images**: Based on official AWS Lambda Python images
- **Build Environments**: Enhanced with development tools and overridden entrypoint for command execution

## Project Structure

```
docker-lambda/
├── base/                          # Base Lambda images
│   ├── 1-base-2-x86_64/         # Core Lambda base
│   └── 2-build-2-x86_64/        # Build environment base
├── runtimes/                      # Runtime-specific images
│   ├── 0-provided.al2-x86_64/   # Custom runtime
│   ├── 1-python3.8-x86_64/      # Python 3.8 runtime ✅
│   ├── 2-python3.9-x86_64/      # Python 3.9 runtime ✅
│   ├── 3-python3.10-x86_64/     # Python 3.10 runtime ✅
│   ├── 4-python3.11-x86_64/     # Python 3.11 runtime ✅
│   └── 5-python3.12-x86_64/     # Python 3.12 runtime ✅
├── build-all.sh                  # Build all images
├── push-all.sh                   # Push all images
└── README.md                     # This file
```

## Development

### Adding New Python Versions

1. Create new runtime directory: `runtimes/X-python3.X-x86_64/`
2. Create `1-run/` and `2-build/` subdirectories
3. Use official AWS Lambda image: `FROM public.ecr.aws/lambda/python:3.X`
4. Override entrypoint in build environment: `ENTRYPOINT []`
5. Update `build-all.sh` and `push-all.sh` scripts

### Testing

```bash
# Test Python 3.8 runtime
docker run --rm javiortizmol/docker-lambda:python3.8-x86_64 python3.8 --version

# Test Python 3.9 runtime
docker run --rm javiortizmol/docker-lambda:python3.9-x86_64 python3.9 --version

# Test Python 3.10 runtime
docker run --rm javiortizmol/docker-lambda:python3.10-x86_64 python3.10 --version

# Test Python 3.11 runtime
docker run --rm javiortizmol/docker-lambda:python3.11-x86_64 python3.11 --version

# Test Python 3.12 runtime
docker run --rm javiortizmol/docker-lambda:python3.12-x86_64 python3.12 --version

# Test build environments
docker run --rm javiortizmol/docker-lambda:python3.8-build-x86_64 python3.8 -m pip --version
docker run --rm javiortizmol/docker-lambda:python3.9-build-x86_64 python3.9 -m pip --version
docker run --rm javiortizmol/docker-lambda:python3.10-build-x86_64 python3.10 -m pip --version
docker run --rm javiortizmol/docker-lambda:python3.11-build-x86_64 python3.11 -m pip --version
docker run --rm javiortizmol/docker-lambda:python3.12-build-x86_64 python3.12 -m pip --version
```