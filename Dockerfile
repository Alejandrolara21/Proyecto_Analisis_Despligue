# Usa una imagen base de Python
FROM python:3.9-slim

# Establece el directorio de trabajo
WORKDIR /app

# Copia los archivos del proyecto al contenedor
COPY . /app/

# Configura variables de entorno, si es necesario
ENV NIXPACKS_PATH /opt/venv/bin:$NIXPACKS_PATH

# Crea y activa el entorno virtual
RUN python -m venv /opt/venv
SHELL ["/opt/venv/bin/activate", "&&"]

# Actualiza pip
RUN pip install --upgrade pip

# Instala numpy primero y luego el resto de las dependencias
RUN pip install numpy>=1.20.0 --no-cache-dir -r requirements.txt

# Restaura el SHELL predeterminado
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Especifica el comando predeterminado a ejecutar cuando se inicie el contenedor
CMD ["python", "index.py"]