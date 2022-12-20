from setuptools import setup

setup(
    name="chat-gpc-cli",
    description='A natural language command line interface powered by chatgpc',
    version="0.1",
    dependencies = [ "openai" ],
    include_package_data=True,
    install_requires=["click"],
    license='MIT',
    entry_points="""
        [console_scripts]
        natural=chat_gpci:cli
    """
)

