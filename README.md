# Omarchy Stardate

A Stardate bar widget for Omarchy Shell.

<img width="347" height="55" alt="screenshot-2026-08-20_18-38-09" src="https://github.com/user-attachments/assets/af795735-7310-4a04-b4a4-cee558ac3610" />


## Formula

Stardate = (Year - 2323) × 1000 + (DayOfYear / DaysInYear) × 1000

## Features

- Displays the current Stardate in the Omarchy bar
- Updates once per hour
- Shows the precise Stardate and calendar date in its tooltip
- Refreshes manually when clicked

## Installation

Clone the repository into your Omarchy plugins directory:

```bash
git clone https://github.com/ElChacoVeloz/omarchy-stardate.git \
  ~/.config/omarchy/plugins/iserrano.stardate
```

Add the widget to `~/.config/omarchy/shell.json`:

```json
{
  "id": "iserrano.stardate"
}
```

Restart Omarchy Shell:

```bash
omarchy restart shell
```

## Remove

omarchy plugin remove iserrano.stardate --yes
