from setuptools import setup

setup(
    name="chatgpt-cli",
    description="A natural language command line interface powered by chatgpt",
    long_description_content_type="text/markdown",
    long_description=open("README.md").read(),
    version="0.3",
    include_package_data=True,
    install_requires=["click", "openai"],
    license="MIT",
    entry_points="""
        [console_scripts]
        chatgpt=chatgpt:cli
    """,
)
