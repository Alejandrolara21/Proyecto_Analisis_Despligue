# Usa una imagen base de Python
FROM python:3.9-slim

# Establece el directorio de trabajo
WORKDIR /app

# Copia los archivos del proyecto al contenedor
COPY . /app/

# Configura variables de entorno, si es necesario
ENV NIXPACKS_PATH /opt/venv/bin:$NIXPACKS_PATH

# Dividir el comando RUN para facilitar la lectura y depuración
RUN . /opt/venv/bin/activate && pip install --upgrade pip

# Instala numpy primero y luego el resto de las dependencias
RUN . /opt/venv/bin/activate && pip install numpy>=1.20.0
RUN . /opt/venv/bin/activate && pip install --no-cache-dir -r requirements.txt

# Especifica el comando predeterminado a ejecutar cuando se inicie el contenedor
CMD ["python", "index.py"]