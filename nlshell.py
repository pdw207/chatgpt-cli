#!/usr/bin/env python3
import click, os, requests


@click.command()
@click.argument("input", nargs=-1)
def cli(input):
    # ChatGPT Wrapper published in https://openai.com/blog/openai-api/

    # Confirm openai key is set
    if not os.getenv("OPENAI_API_KEY"):
        config_path = "~/.zshrc" if "zsh" in os.getenv("SHELL") else "~/.bashrc"
        click.echo("\nCreate OpenAI key at https://beta.openai.com/account/api-keys")
        click.echo(
            f"Copy and paste using your key `echo export OPENAI_API_KEY=XXXXXX >> {config_path}`\n"
        )
        return

    prompt = """Input: List files
    Output: ls -la

    Input: Count files in a directory
    Output: ls -la | wc -l

    Input: Disk space used by home directory
    Output: du ~

    Input: Replace foo with bar in all .py files
    Output: sed -i .bak -- 's/foo/bar/g' *.py

    Input: Delete the models subdirectory
    Ouptut: rm -rf ./models"""

    template = """

    Input: {}
    Output:"""

    prompt += template.format(" ".join(input))

    url = "https://api.openai.com/v1/engines/davinci/completions"
    headers = {
        "Authorization": f"Bearer {os.getenv('OPENAI_API_KEY')}",
        "Content-Type": "application/json",
    }
    data = {"prompt": prompt, "max_tokens": 100, "temperature": 0.0, "stop": "\n"}

    try:
        response = requests.post(url, headers=headers, json=data)

        if response.status_code == 200:
            command = response.json()["choices"][0]["text"]

            if click.confirm(f">>> Run: {click.style(command, 'red')}", default=False):
                os.system(command)
        else:
            click.echo(
                "Request failed with status code: {}".format(response.status_code)
            )
            click.echo("Error: {}".format(response.text))

    except requests.exceptions.RequestException as e:
        click.echo("An error occurred during the API request: {}".format(str(e)))


if __name__ == "__main__":
    cli()
