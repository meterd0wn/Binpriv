
# Binaries Priv Esc Tool (OSCP)

This shell script tool is designed to automate Binaries privilege escalation test cases by leveraging the power of different tools. It allows users to quickly gather information about binaries and search for relevant exploits and shellcodes.

*My OSCP Notes: [OSCP (notion.so)](https://www.notion.so/9686fa15b4e74bacb0a238313f55665d?v=0646184c32254ce892a342d9df931b86)*

**Note:** This repo is in development. I am adding test cases as I find out something I want to automate.

## Author

- **Daniel Paul** (aka @meterd0wn)

## Description

The script enables users to specify a file containing binary paths and a search string. It will utilize the `searchbins` tool to collect information about the binaries and the `searchsploit` tool to find relevant exploits and shellcodes based on the provided search string. This is particularly useful for penetration testers and security researchers.

## Installation

1. Clone this repository.
2. Make the scripts executable if not:

   ```bash
   chmod +x binpriv.sh
   chmod +x install.sh
   chmod +x searchbins.sh
   ```
3. Install the tool by running the install.sh script.

   ```bash
   ./install.sh
   ```


## Usage

```bash
./binpriv.sh -s <file_path> -x <search_string>
```

### Options

- `-s <file_path>`: Specify the file path containing binary paths (one per line).
- `-x <search_string>`: Specify the string to use when searching with `searchsploit`. For example, use `-x priv` or `-x "priv esc"`.
- `-h`: Display this help message.

### Example

To use the tool, run the following command:

```bash
./binpriv.sh -s /path/to/binary_list.txt -x "rce"
```

This command will list the number of found exploits and shellcodes for each binary specified in the `binary_list.txt` file related to remote code execution and will list if any binary has commands to escalate privilege by searching for GTFOBins.

## Credits
- https://gtfobins.github.io/
- https://github.com/r1vs3c/searchbins/tree/main
- https://gitlab.com/exploit-database/exploitdb

## License

This project is licensed under the MIT License. Feel free to use, modify, and distribute as you see fit.

## Acknowledgments

This tool is inspired by the `searchbins` tool from [r1vs3c](https://github.com/r1vs3c/searchbins/tree/main) and the `searchsploit` tool, which provide valuable resources for security researchers and pentesters.

For any issues, suggestions, or contributions, please feel free to reach out or submit a pull request.

## Support

If you encounter any issues or have questions about using the tool, please open an issue on the repository.
