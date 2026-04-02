# .env.example — {{APP_NAME}}
# Copy this file to .env and fill in real values.
# Never commit .env to git.

# App
APP_NAME={{APP_NAME}}
APP_URL=http://localhost:{{PORT}}
NODE_ENV=development

# Database
DATABASE_URL={{DATABASE_URL}}

# Auth
# {{AUTH_PROVIDER}} keys
{{AUTH_SECRET_KEY}}={{VALUE}}
{{AUTH_PUBLIC_KEY}}={{VALUE}}

# External services
# Add any third-party API keys here
# {{SERVICE_NAME}}_API_KEY={{VALUE}}
