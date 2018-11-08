FROM microsoft/nanoserver
SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop';"]

RUN iwr -outfile openssl.zip https://indy.fulgan.com/SSL/openssl-1.0.2p-x64_86-win64.zip; \
    [System.IO.Compression.ZipFile]::ExtractToDirectory('openssl.zip', 'c:\openssl')

RUN mkdir c:\certs
WORKDIR c:/certs

RUN [Environment]::SetEnvironmentVariable( "Path", $env:Path + ";C:\openssl" , [System.EnvironmentVariableTarget]::Machine )

ENTRYPOINT powershell -noexit

