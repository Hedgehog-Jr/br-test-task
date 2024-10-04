FROM alpine:latest

RUN apk add --no-cache wget unzip curl

# Install terraform
RUN wget https://releases.hashicorp.com/terraform/1.5.2/terraform_1.5.2_linux_amd64.zip \
   && unzip terraform_1.5.2_linux_amd64.zip \
   && mv terraform /usr/local/bin/ \
   && rm terraform_1.5.2_linux_amd64.zip \
   && chmod +x /usr/local/bin/terraform


COPY ./scripts/plan.sh ./plan.sh
COPY ./scripts/apply.sh ./apply.sh

ARG TF_COMMAND
RUN if [ "$TF_COMMAND" = "plan" ]; then \
        mv ./plan.sh ./entrypoint.sh; \
    elif [ "$TF_COMMAND" = "apply" ]; then \
        mv ./apply.sh /entrypoint.sh; \
    fi
RUN chmod +x ./entrypoint.sh

COPY ./infra ./

CMD ["./entrypoint.sh"]
