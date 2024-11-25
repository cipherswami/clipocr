# ClipOCR :: CIPH3R

## Introduction

`ClipOCR` is a python script to extract the text from clipboard images and then automatically copy back the recognized text to clipboard.

## Motive

- Many users often need to extract text from images quickly without manually typing or scanning the text. `ClipOCR` solves this problem by providing an automated way to capture text from clipboard images.
  
## Pre Installation:

- Clone the repository using the following command (or) download the latest ZIP file from [here](https://codeload.github.com/cipherswami/clipocr/zip/refs/heads/main), and extract it:

    ```sh
    git clone https://github.com/cipherswami/clipocr.git
    ```

- Install Tesseract OCR from [here](https://github.com/tesseract-ocr/tesseract), and ensure it is added to your system PATH.

  - Now go to the src folder containing `clipocr.py` and edit the script to configure the path for Tesseract OCR if needed:

    ```python
    # Set your custom Tesseract OCR's path if changed
    pytesseract.pytesseract.tesseract_cmd = r'C:\your\path\to\tesseract.exe'
    ```

- Ensure **Python 3** is installed. If not download it from [python.org](https://www.python.org/downloads/) and install, while installing ensure you check the box to **Add Python to PATH** during installation. 

  - Verify the version and install dependencies:

    - To check version:
      ```powershell
      python --version
      ```
    - To install dependencies:
      ```
      pip install -r requirements.txt
      ```

## Installation

- To install, right-click on the `install.bat` and run it as **Administrator**:

  - If you encounter **Windows protected your PC** popup, click on `More info` and then choose `Run anyway` (or) If you see any **Unknown publisher** popup, simply choose `Run`.

  - NOTE: This is a simple installer script; there is no need to worry about any viruses. The entire code is open source, so you can review it if you wish.

- et voilà! installation is done. Now, you can safly delete the repository.

- **Usage**: Use "`CTRL + ALT + C`" to automatically copy the recognisable text from clipboard images back to the clipboard.
  
**NOTE**: `Do not delete` the desktop shortcut file.

## Uninstallation

- To uninstall, simply right-click on the `uninstall.bat` and run it as **Administrator**:

  - If you encounter **Windows protected your PC** popup, click on `More info` and then choose `Run anyway` (or) If you see any **Unknown publisher** popup, simply choose `Run`.

  - NOTE: This is a simple uninstaller script; there is no need to worry about any viruses. The entire code is open source, so you can review it if you wish.

# People

### Author
- Aravind Potluri \<aravindswami135@gmail.com\>

# License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

Feel free to contribute to this project by opening issues and submitting pull requests. Your feedback and contributions are highly appreciated!
