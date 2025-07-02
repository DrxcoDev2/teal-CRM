# Usa Arch como base
FROM archlinux:base

# Evita escritura de pyc y salida con buffer
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Carpeta de trabajo
WORKDIR /app

# Instala Python, pip y dependencias de compilaci�n
RUN pacman -Syu --noconfirm && \
    pacman -S --noconfirm \
    python \
    python-pip \
    python-setuptools \
    python-wheel \
    gcc \
    make \
    libpq \
    postgresql-libs \
    && pacman -Scc --noconfirm

# Copia e instala requirements
COPY requirements.txt .
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Copia todo el proyecto
COPY . .

# Exp�n el puerto de Gunicorn
EXPOSE 8000

# Ejecuta Gunicorn apuntando al wsgi de `tealcrm`
CMD ["gunicorn", "tealcrm.wsgi:application", "--bind", "0.0.0.0:8000"]
