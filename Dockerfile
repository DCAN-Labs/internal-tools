
FROM dcanumn/external-software:v0.0.7

RUN apt-get update && apt-get install -yq --no-install-recommends \
        python2.7 \
        python-pip

RUN pip2 install setuptools wheel
RUN pip2 install pyyaml numpy pillow

RUN mkdir /opt/dcan-tools
WORKDIR /opt/dcan-tools

# dcan bold processing
ADD https://github.com/DCAN-Labs/dcan_bold_processing.git version.json
RUN git clone -b v4.1.0rc1 --single-branch --depth 1 https://github.com/DCAN-Labs/dcan_bold_processing.git dcan_bold_proc

# dcan executive summary
RUN git clone -b v2.2.10 --single-branch --depth 1 https://github.com/DCAN-Labs/ExecutiveSummary.git executivesummary
RUN gunzip /opt/dcan-tools/executivesummary/templates/parasagittal_Tx_169_template.scene.gz

# dcan custom clean
RUN git clone -b v2.0.3 --single-branch --depth 1 https://github.com/DCAN-Labs/CustomClean.git customclean

# dcan file mapper
RUN git clone -b v1.3.0 --single-branch --depth 1 https://github.com/DCAN-Labs/file-mapper.git filemapper

