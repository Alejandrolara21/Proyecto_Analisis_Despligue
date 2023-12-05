# Usa una imagen base de Python
FROM python:3.8-slim

# Establece el directorio de trabajo
WORKDIR /app

# Copia los archivos del proyecto al contenedor
COPY . /app/

# Configura variables de entorno, si es necesario
ENV NIXPACKS_PATH /opt/venv/bin:$NIXPACKS_PATH

# Dividir el comando RUN para facilitar la lectura y depuración
RUN --mount=type=cache,id=s/f12e5f47-88c1-4612-8d26-10f175fddb0f-/root/cache/pip,target=/root/.cache/pip \
    python -m venv --copies /opt/venv

# Usa Bash para activar el entorno virtual y luego instala las dependencias
RUN . /opt/venv/bin/activate && pip install --upgrade pip && pip install -r requirements.txt

# Especifica el comando predeterminado a ejecutar cuando se inicie el contenedor
CMD ["python", "index.py"]
