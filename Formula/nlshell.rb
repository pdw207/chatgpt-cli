class Nlshell < Formula
  include Language::Python::Virtualenv

  desc "Natural language command-line interface powered by OpenAI's ChatGPT"
  homepage 'https://github.com/pdw207/chatgpt-cli'
  url 'https://github.com/pdw207/chatgpt-cli/releases/download/v0.5.0/nlshell-0.5.tar.gz'
  sha256 'a736b6e177c172eaacdb7b3452d10e6cad22aae238c369323095284b3fcf9822'
  license 'MIT'

  resource 'certifi' do
    url 'https://files.pythonhosted.org/packages/37/f7/2b1b0ec44fdc30a3d31dfebe52226be9ddc40cd6c0f34ffc8923ba423b69/certifi-2022.12.7.tar.gz'
    sha256 '35824b4c3a97115964b408844d64aa14db1cc518f6562e8d7261699d1350a9e3'
  end

  resource 'charset-normalizer' do
    url 'https://files.pythonhosted.org/packages/a1/34/44964211e5410b051e4b8d2869c470ae8a68ae274953b1c7de6d98bbcf94/charset-normalizer-2.1.1.tar.gz'
    sha256 '5a3d016c7c547f69d6f81fb0db9449ce888b418b5b9952cc5e6e66843e9dd845'
  end

  resource 'click' do
    url 'https://files.pythonhosted.org/packages/59/87/84326af34517fca8c58418d148f2403df25303e02736832403587318e9e8/click-8.1.3.tar.gz'
    sha256 '7682dc8afb30297001674575ea00d1814d808d6a36af415a82bd481d37ba7b8e'
  end

  resource 'idna' do
    url 'https://files.pythonhosted.org/packages/8b/e1/43beb3d38dba6cb420cefa297822eac205a277ab43e5ba5d5c46faf96438/idna-3.4.tar.gz'
    sha256 '814f528e8dead7d329833b91c5faa87d60bf71824cd12a7530b5526063d02cb4'
  end

  resource 'openai' do
    url 'https://files.pythonhosted.org/packages/63/50/bfc6c276d474b826353a155fbd478c81b035158549cfc2ce1a14215fe364/openai-0.25.0.tar.gz'
    sha256 '59ac6531e4f7bf8e9a53186e853d9ffb1d5f07973ecb4f7d273163a314814510'
  end

  resource 'requests' do
    url 'https://files.pythonhosted.org/packages/a5/61/a867851fd5ab77277495a8709ddda0861b28163c4613b011bc00228cc724/requests-2.28.1.tar.gz'
    sha256 '7c5599b102feddaa661c826c56ab4fee28bfd17f5abca1ebbe3e7f19d7c97983'
  end

  resource 'urllib3' do
    url 'https://files.pythonhosted.org/packages/c2/51/32da03cf19d17d46cce5c731967bf58de9bd71db3a379932f53b094deda4/urllib3-1.26.13.tar.gz'
    sha256 'c083dd0dce68dbfbe1129d5271cb90f9447dea7d52097c6e0126120c521ddea8'
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    ls_command = "#{bin}/nlshell list files in current directory"

    assert_match(/Create OpenAI key/, shell_output(ls_command))

    ENV['OPENAI_API_KEY'] = 'SECRET'

    assert_match(/invalid_api_key/, shell_output(ls_command))
  end
end
