import os

def clear_screen():
    os.system('clear')

def center_text(text, width):
    padding = (width - len(text)) // 2
    return " " * padding + text

def draw_yellow_border(width, height):
    border = "+" + "-" * (width - 2) + "+"
    yellow_border = f"\033[33m{border}\033[0m"
    return yellow_border

def display_centered_content(content, border_padding=2):
    clear_screen()
    terminal_width, terminal_height = os.get_terminal_size()
    lines = content.split('\n')
    content_width = max(len(line) for line in lines)
    content_height = len(lines)

    start_x = (terminal_width - content_width) // 2
    start_y = (terminal_height - content_height) // 2

    clear_screen()

    for _ in range(start_y):
        print()

    top_border = draw_yellow_border(terminal_width, border_padding)
    print(top_border)

    for line in lines:
        centered_line = center_text(line, terminal_width)
        print(f"\033[33m| {centered_line} |\033[0m")

    bottom_border = draw_yellow_border(terminal_width, border_padding)
    print(bottom_border)

def show_menu():
    options = [
        "Option 1: Run action A",
        "Option 2: Run action B",
        "Option 3: Run action C",
        "Option 4: Exit"
    ]

    menu = "\n".join(options)

    content = """
    Choose an option from the menu:
    {}
    """.format(menu)

    while True:
        display_centered_content(content)

        choice = input("Enter the option number or 'q' to exit: ").strip().lower()

        if choice == '1':
            actionA()
        elif choice == '2':
            actionB()
        elif choice == '3':
            actionC()
        elif choice == '4' or choice == 'q':
            return
        else:
            input("Invalid choice. Press Enter to continue...")

def actionA():
    clear_screen()
    print("Running action A...")
    ls # Your action A logic here
    input("Press Enter to continue...")

def actionB():
    clear_screen()
    print("Running action B...")
    # Your action B logic here
    input("Press Enter to continue...")

def actionC():
    clear_screen()
    print("Running action C...")
    # Your action C logic here
    input("Press Enter to continue...")

if __name__ == "__main__":
    show_menu()

