FROM rocker/shiny

# Install dependencies
RUN apt-get update && \
    apt-get install -y git libssl-dev/unstable libv8-3.14-dev && \
    Rscript -e 'install.packages(c("devtools", "dplyr", "ggplot2", "knitr", "readr", "tufte"))'

# Get index.rmd to serve
RUN rm -R /srv/shiny-server/* && \
    git clone https://github.com/CoEDL/vyov /srv/shiny-server
