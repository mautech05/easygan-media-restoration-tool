import importlib.util
import sys
spec = importlib.util.find_spec(sys.argv[1])
if spec is None:
    print("Not Installed")
else:
    print("Installed")
