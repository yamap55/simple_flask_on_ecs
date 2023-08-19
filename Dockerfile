FROM python:3.11.4
# change default shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN chsh -s /bin/bash

WORKDIR /project

# Increase timeout for apt-get to 300 seconds
RUN /bin/echo -e "\n\
    Acquire::http::Timeout \"300\";\n\
    Acquire::ftp::Timeout \"300\";" >> /etc/apt/apt.conf.d/99timeout

# Configure apt and install packages
RUN rm -rf /var/lib/apt/lists/* \
    && apt-get update \
    && apt-get -y --no-install-recommends install sudo vim tzdata less \
    && apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*


# poetry install
ENV PATH "/root/.local/bin:$PATH"
ENV POETRY_VIRTUALENVS_IN_PROJECT=true
RUN curl -sSL https://install.python-poetry.org | python -

COPY . .

RUN poetry install --only main,prod --sync

ENV DEBIAN_FRONTEND=

WORKDIR /project/api

CMD ["poetry", "run", "gunicorn", "--bind", "0.0.0.0:8000", "--log-level", "debug", "app:app"]
