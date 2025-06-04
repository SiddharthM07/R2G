artifact_code = """
def hello_world():
    print("Hello from the generated Python artifact!")

if __name__ == "__main__":
    hello_world()
"""

artifact_filename = "artifact_script.py"

with open(artifact_filename, "w") as f:
    f.write(artifact_code)

print(f"✅ Artifact '{artifact_filename}' created successfully!")
