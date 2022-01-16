#!/bin/bash
(echo Building... && npm run build && cp ./manifest.json ./dist/)\
&& echo Complete!\
|| echo Failed
