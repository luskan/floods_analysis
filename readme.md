[Visit the Flood Yearly Statistics Dashboard](https://luskan.github.io/floods_analysis/)

# Flood Yearly Statistics Dashboard

## Overview
This project is a web-based dashboard that provides insights into yearly flood statistics across various countries, based on data sourced from reputable flood databases. The visualization aims to help users understand flood occurrences, fatalities, persons affected, and economic losses by using interactive charts.

## Features
- **Interactive Chart Visualizations**: The application uses Chart.js to provide bar and pie charts for better understanding flood statistics.
- **Customizable Data Filters**: Users can select between datasets, specific countries, time ranges, and different aspects of the data (e.g., occurrences, fatalities, etc.) to analyze.
- **Detailed Table View**: Click on the bars in the chart to view detailed records for the selected time period.

## Datasets
The dashboard supports data from the following sources:

1. **HANZE Dataset**: Contains data on the total number of floods by type that have occurred in 42 European countries from 1870 to 2020. Also includes average annual flood deaths per million persons.
    - [HANZE Dataset](https://naturalhazards.eu/)
    - [Zenodo Record](https://zenodo.org/records/11259233)
    - License: Creative Commons Attribution 4.0 International

2. **Dartmouth Flood Observatory**: A global active archive of large flood events from 1985 to the present.
    - [Dartmouth Flood Observatory](https://floodobservatory.colorado.edu/index.html)
    - License: The Global Active Archive is made available without charge for scholarly research and education purposes.

## Requirements
To run this project locally, you need the following:
- Modern Web Browser
- A local HTTP server (e.g., using Python `http.server`)

## Installation
1. Clone the repository:
   ```sh
   git clone https://github.com/username/flood-yearly-statistics-dashboard.git
   ```
2. Navigate into the project directory:
   ```sh
   cd flood-yearly-statistics-dashboard
   ```
3. Open index.html in you browser
   
4. To check if there is an updated dartmouth data, run data/update_data.sh and reload page

## Usage
- **Select Dataset**: Choose between `HANZE` and `Dartmouth Flood Observatory` datasets using the dropdown.
- **Time Lapse Selection**: You can select different time intervals (e.g., 1, 5, 10 years) to group the data accordingly.
- **Country Filter**: Narrow down the data to a specific country.
- **Chart Options**: Select different data points like `Count of Occurrences`, `Total Fatalities`, `Total Persons Affected`, or `Total Losses`. Toggle between bar chart and pie chart using the checkbox.
- **Detailed View**: Click on a bar in the chart to view detailed records in the table below.

## Dependencies
- **Bootstrap**: Used for responsive design and styling.
- **PapaParse**: JavaScript library for parsing CSV files.
- **Chart.js**: JavaScript library for creating interactive charts.

## Contact
For questions or inquiries related to this application, please contact:
- **Marcin Jędrzejewski**: [marcinje@gmail.com](mailto:marcinje@gmail.com)

For questions related to the data, please contact the respective data sources listed above.

## License
This project is licensed under the MIT License. See the `LICENSE` file for details.

## Acknowledgments
Special thanks to the data providers and organizations contributing to public flood data, including HANZE and Dartmouth Flood Observatory, for making this project possible.

