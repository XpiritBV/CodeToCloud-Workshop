FROM ghcr.io/xpiritbv/base-ghws-pwsh
ARG action
ARG exercise
ENV SOURCEREPO="https://github.com/XpiritBV/CodeToCloud-Solution"
ENV ACTION=${action}
ENV EXERCISE=${exercise}
ADD ./fixme.ps1 .
CMD ["/usr/bin/pwsh" ,"fixme.ps1", "-Verbose"]
