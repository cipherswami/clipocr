from PIL import Image, ImageGrab
import pytesseract
import pyperclip
import os

# Path to Tesseract-OCR executable
pytesseract.pytesseract.tesseract_cmd = r"C:\Program Files\Tesseract-OCR\tesseract.exe"

def extract_text_from_image(image):
    """
    Perform OCR on the given image and return the extracted text.
    """
    try:
        text = pytesseract.image_to_string(image)
        return text.strip()
    except Exception as e:
        print(f"Error during OCR: {e}")
        return None

def handle_clipboard():
    """
    Check clipboard for an image or file path, perform OCR, and place the text back in the clipboard.
    """
    try:
        clipboard_data = ImageGrab.grabclipboard()

        if isinstance(clipboard_data, Image.Image):
            # Handle raw image in clipboard
            print("Image detected in clipboard. Extracting text...")
            text = extract_text_from_image(clipboard_data)
        elif isinstance(clipboard_data, list) and len(clipboard_data) > 0:
            # Handle file path in clipboard
            file_path = clipboard_data[0]
            if os.path.isfile(file_path):
                print(f"File path detected in clipboard: {file_path}")
                with Image.open(file_path) as img:
                    text = extract_text_from_image(img)
            else:
                print("Invalid file path in clipboard.")
                return
        else:
            print("No image or valid file path found in clipboard.")
            return

        if text:
            # Copy the extracted text to the clipboard
            pyperclip.copy(text)
            print("Extracted text placed in clipboard.")
            # print(text)
        else:
            print("No text could be extracted.")

    except Exception as e:
        print(f"An error occurred: {e}")

# Run the function
handle_clipboard()

