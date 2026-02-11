#!/bin/bash
set -a
source .env
set +a

if [ "${ENV}" == "DEV" ]; then
    echo "Running dev environment"
    # Added --loop asyncio and --http h11
    uvicorn app.main:app --reload --host=0.0.0.0 --port=8000 --loop asyncio --http h11
else
    echo "Running prod environment"
    # Added --loop asyncio and --http h11
    uvicorn app.main:app --host=0.0.0.0 --port=8000 --loop asyncio --http h11
fi
