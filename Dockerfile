# Usa una imagen base de Python
FROM python:3.9-slim

# Establece el directorio de trabajo
WORKDIR /app

# Copia los archivos del proyecto al contenedor
COPY . /app/

# Configura variables de entorno, si es necesario
ENV NIXPACKS_PATH /opt/venv/bin:$NIXPACKS_PATH

# Crea el entorno virtual y activa el entorno virtual
RUN python -m venv /opt/venv
SHELL ["/bin/bash", "-c", "source /opt/venv/bin/activate && pip install --upgrade pip"]

# Instala Flask 3.0.0 y otras dependencias
RUN pip install Flask numpy>=1.20.0 --no-cache-dir -r requirements.txt

# Especifica el comando predeterminado a ejecutar cuando se inicie el contenedor
CMD ["python", "index.py"]
