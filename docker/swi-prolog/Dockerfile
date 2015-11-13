FROM ubuntu:12.04

RUN apt-get update -qq && apt-get install -y software-properties-common
RUN apt-get install -y python-software-properties
RUN apt-add-repository -y ppa:swi-prolog/stable
RUN apt-get update -qq && apt-get install -y swi-prolog
