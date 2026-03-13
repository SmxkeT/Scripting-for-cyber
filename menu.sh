#!/bin/bash
#Script to ingest CSV file and use GREP or AWK to parse.
while true; do
        if whiptail --title "Continue or exit" --yesno "Yes continue or No Exit" 10 70; then
                :
        else
                exit 0
        fi

        CHOICE=$(whiptail --title "Grep or AWK" --menu "Select Option" 15 70 2 \
                "Grep" "Grep file" \
                "AWK" "AWK file" \
                3>&1 1>&2 2>&3)

        if [[ "$CHOICE" = "Grep" ]]; then
                CSV=$(whiptail --title "Grep CSV" --inputbox "Enter .CSV Filename" 10 70 3>&1 1>&2 2>&3)
        elif [[ "$CHOICE" = "AWK" ]]; then
                CSV=$(whiptail --title "AWK CSV" --inputbox "Enter .CSV Filename" 10 70 3>&1 1>&2 2>&3)
        fi

        if [[ "$CSV" != "fruit.csv" && "$CSV" != "veg.csv" ]]; then
                whiptail --title "Error" --msgbox "Unknown Filename" 10 70
                continue
        fi

        if [[ "$CHOICE" = "Grep" ]]; then
        Out=$(grep "e" "$CSV")
        elif [[ "$CHOICE" = "AWK" ]]; then
        Out=$(awk -F',' '{print $2}' "$CSV")
        fi

        whiptail --title "Output from .CSV" --msgbox "$Out" 20 70
done
