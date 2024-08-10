FROM python:3.11

WORKDIR /app

# Create the environment:
COPY requirements.txt .
RUN pip install -r requirements.txt

# Check dependencies
RUN echo "Make sure notebook is installed:"
RUN python -c "import notebook"

# The code to run when container is started:
ENTRYPOINT ["jupyter", "notebook", "--ip=0.0.0.0", "--no-browser", "--allow-root"]
