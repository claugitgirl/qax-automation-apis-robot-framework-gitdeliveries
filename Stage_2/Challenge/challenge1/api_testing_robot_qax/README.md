  # 🚀 Proyecto Base de Automatización con Robot Framework

  Este proyecto contiene una estructura mínima para iniciar pruebas automatizadas de APIs utilizando **Robot Framework** y **RequestsLibrary**.

  ---

  ## 🔧 Configuración del entorno

    ### 1. Crear y activar entorno virtual

  🪟 En **Windows**:
  
  bash
  python -m venv venv
  venv\Scripts\activate
  

  🍎 En Mac/Linux:
  bash
  python3 -m venv venv
  source venv/bin/activate
  

  ###  2. Instalar dependencias

  bash
  pip install -r requirements.txt
  

  ### ▶️ Ejecutar pruebas
  Ejecutar todas las pruebas y guardar resultados en la carpeta output:

  bash
  robot -d output tests/
  