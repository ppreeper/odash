sudo apt update -y
sudo apt install -y python3-pip python3-venv direnv git
pip install pipenv
if grep -q "direnv hook bash" $HOME/.bashrc; then
  echo
else
  echo 'eval "$(direnv hook bash)"' >> $HOME/.bashrc
fi
git clone https://github.com/ppreeper/opensetup $HOME/opensetup
source $HOME/.bashrc
