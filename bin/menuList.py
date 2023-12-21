import os
import subprocess

def clear_screen():
    os.system("clear")  # Clear the terminal screen

def print_menu(choices):
    clear_screen()
    print("Choose an option:\n")
    for i, choice in enumerate(choices, start=1):
        print(f" {i}. {choice}")
    print("\n")

def run_command_in_terminal(command):
    subprocess.run(["bash", "-c", command])
    input("Press Enter to continue...")

def main():
    choices = ["Login to Dietpi - Digital Coaxal", "Get the local Weather Forcast", "System stats via btop", "Quit"]

    while True:
        print_menu(choices)
        choice = input("Enter your choice: ")

        if choice == "1":
            run_command_in_terminal("ssh dietpi@dietpi")
        elif choice == "2":
            run_command_in_terminal("curl wttr.in")
        elif choice == "3":
            run_command_in_terminal("btop")
        elif choice == "4":
            print("Goodbye!")
            break
        else:
            print("Invalid choice")

        input("Press Enter to continue...")

if __name__ == "__main__":
    main()

