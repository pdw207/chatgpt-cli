from setuptools import setup

setup(
    name="nlshell",
    description="A natural language command line interface powered by chatgpt",
    long_description_content_type="text/markdown",
    long_description=open("README.md").read(),
    version="0.5",
    include_package_data=True,
    install_requires=["click"],
    license="MIT",
    entry_points="""
        [console_scripts]
        nlshell=nlshell:cli
    """,
)
