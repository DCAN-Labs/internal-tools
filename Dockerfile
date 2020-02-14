FROM dcanlabs/external-software:dev

RUN apt-get update && apt-get install -yq --no-install-recommends \
        python2.7 \
        python-pip

RUN pip2 install setuptools wheel
RUN pip2 install pyyaml numpy pillow

RUN mkdir /opt/dcan-tools
WORKDIR /opt/dcan-tools

# dcan bold processing
RUN git clone -b v4.0.3 --single-branch --depth 1 https://github.com/DCAN-Labs/dcan_bold_processing.git dcan_bold_proc

# dcan executive summary
RUN git clone --branch feat/anat-only --single-branch --depth 1 https://github.com/DCAN-Labs/ExecutiveSummary.git executivesummary
RUN git checkout 9fef1f1b0208aa98149549f763686f4a4cad6f01
RUN gunzip /opt/dcan-tools/executivesummary/templates/parasagittal_Tx_169_template.scene.gz

# dcan custom clean
RUN git clone -b v0.0.0 --single-branch --depth 1 https://github.com/DCAN-Labs/CustomClean.git customclean
