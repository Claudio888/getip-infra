import testinfra

def test_configexiste(host):
    assert host.file("/root/.aws/config").exists
    assert host.file("/root/.aws/credentials").exists    

def test_dockerlogin(host):
    assert host.run("aws ecr get-login-password | docker login --username AWS --password-stdin 933375035704.dkr.ecr.us-east-1.amazonaws.com/getip-images")