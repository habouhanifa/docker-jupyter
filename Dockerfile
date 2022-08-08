FROM jupyter/base-notebook

ENV VIRTUAL_ENV=/home/jovyan/.venv

ENV JUPYTER_THEME=monokai
ENV JUPYTER_CELL_WIDTH=90%
ENV JUPYTER_FONT_SIZE=15



WORKDIR /home/jovyan

RUN python -m venv $VIRTUAL_ENV

ENV PATH="$VIRTUAL_ENV/bin:$PATH"

RUN pip install --upgrade pip


COPY requirements.txt .
RUN pip install -r ./requirements.txt 

RUN jt -t ${JUPYTER_THEME} -cellw ${JUPYTER_CELL_WIDTH} -nfs ${JUPYTER_FONT_SIZE}

RUN ipython kernel install --name .venv --user


