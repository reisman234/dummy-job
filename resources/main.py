import os


INPUT_DIRECTORY = os.getenv("INPUT_DIRECTORY")

DESTINATION = os.getenv("DESTINATION")


def main():
    print(os.environ)

    file_list = []

    input_file = os.path.join(INPUT_DIRECTORY, "input-file")
    if os.path.isfile(input_file):
        print("input_file exists")
        file_list.append(input_file)

    input_archive = os.path.join(INPUT_DIRECTORY, "input-archive")
    if os.path.isdir(input_archive):
        print("input_archive exists")
        for f in os.listdir(input_archive):
            file_list.append(os.path.join(input_archive, f))

    input_directory = os.path.join(INPUT_DIRECTORY, "input-directory")
    if os.path.isdir(input_directory):
        print("input_directory exists")
        for f in os.listdir(input_directory):
            file_list.append(os.path.join(input_directory, f))

    if DESTINATION and file_list:
        print("write result")
        with open(DESTINATION, mode="w+", encoding="utf8") as result_file:
            for filename in file_list:
                with open(filename, encoding="utf8") as read_file:
                    data = read_file.read()

                    result_file.write(filename)
                    result_file.write("\n")
                    result_file.write(data)
                    result_file.write("\n\n")


if __name__ == "__main__":
    main()
