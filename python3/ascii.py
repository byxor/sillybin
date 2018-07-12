def to_hex(character):
    output = hex(ord(character))
    return output[:2] + output[2:].upper()
    
print("PlainText -> ASCII Converter!\n")

while True:
    message = input("Enter text: ")
    output = ", ".join(map(to_hex, message))
    print(f"{output}\n")


    

