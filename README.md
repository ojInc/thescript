# INTRO
Handige Raspberry Pi 2,3,4 script om jouw pi te setup

# Stappenplan
Dit vergemakkelijk jouw leven op een Pi

# Voorvereisten
- Je gebruikt RaspberryPiOS, MacOS of Ubuntu/Linux
- Je hebt minimaal >=Python 3.7 en virtualenv  alreeds geïnstalleerd
- Je bent ingelogd als gebruiker pi

## Stap 1: installeren Pete Scargill script
Login op jouw Pi als gebruiker pi.  NIET op Pi0 dit duurt te lang!!

```bash
pi@rpasberrypi: $ sudo apt install -y git
pi@rpasberrypi: $ git clone https://github.com/pappavis/thescript/
pi@rpasberrypi: $ cd thescript && wget https://bitbucket.org/api/2.0/snippets/scargill/kAR5qG/master/files/script.sh
pi@rpasberrypi: $ bash ./script.sh
pi@rpasberrypi: $ sudo reboot -h now
```

## Stap 2: Python 3 en circuitpython
Super handig installeert virtualenvironment voor Python, CircuitPython, tesseractOCR en Micropython.

```bash
pi@rpasberrypi: $ cd ~/Downloads
pi@rpasberrypi: $ git clone https://github.com/pappavis/thescript/
pi@rpasberrypi: $ cd ~/Downloads/thescript/
pi@rpasberrypi: $ bash ./iinstallVerzamelupdates.sh
```

# origineel
Zie origineel <a href="https://bitbucket.org/api/2.0/snippets/scargill/kAR5qG/master/files/script.sh">hier</a>

