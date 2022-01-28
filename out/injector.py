import os, sys, re
from html import escape

def repl(foo):
    global code
    return foo[0][:foo.span(1)[0]-foo.span(0)[1]] + escape(code) + foo[0][foo.span(1)[1] - foo.span(0)[0]:]

print("\n------\nPython's Turn!\n------\n")
outfile = sys.argv[1]
root_path = os.getenv('APPDATA')+"/Stormworks/data/vehicles/"
data = open(root_path+outfile).read()

for file in os.scandir(sys.argv[2]+"/release"):
    code = open(file.path).read()
    identifier = file.name[:file.name.rindex('.')]
    print(f"Searching '{outfile}' for Lua block with identifier '{identifier}'")
    data, c = re.subn(f"script=['\"]--{identifier}[\r\n|\n|\r](.*?)['\"]>", repl, data, flags = re.MULTILINE + re.DOTALL)
    open(root_path+outfile, "w").write(data)
    print(f"\tReplaced {c} code blocks with identifier '{identifier}'.")
print("\n------\nBack to you, nameous!\n------\n")