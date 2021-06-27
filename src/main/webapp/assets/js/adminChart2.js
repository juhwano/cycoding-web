// <block:actions:2>
const actions = [
  {
    name: 'Randomize',
    handler(chart) {
      chart.data.datasets.forEach(dataset => {
        dataset.data = Utils.numbers({count: chart.data.labels.length, min: 0, max: 100});
      });
      chart.update();
    }
  },
  {
    name: 'Add Dataset',
    handler(chart) {
      const data = chart.data;
      const dsColor = Utils.namedColor(chart.data.datasets.length);
      const newDataset = {
        label: 'Dataset ' + (data.datasets.length + 1),
        backgroundColor: Utils.transparentize(dsColor, 0.5),
        borderColor: dsColor,
        borderWidth: 1,
        stack: 'combined',
        data: Utils.numbers({count: data.labels.length, min: 0, max: 100}),
      };
      chart.data.datasets.push(newDataset);
      chart.update();
    }
  },
  {
    name: 'Add Data',
    handler(chart) {
      const data = chart.data;
      if (data.datasets.length > 0) {
        data.labels = Utils.months({count: data.labels.length + 1});

        for (var index = 0; index < data.datasets.length; ++index) {
          data.datasets[index].data.push(Utils.rand(0, 100));
        }

        chart.update();
      }
    }
  },
  {
    name: 'Remove Dataset',
    handler(chart) {
      chart.data.datasets.pop();
      chart.update();
    }
  },
  {
    name: 'Remove Data',
    handler(chart) {
      chart.data.labels.splice(-1, 1); // remove the label first

      chart.data.datasets.forEach(dataset => {
        dataset.data.pop();
      });

      chart.update();
    }
  }
];
// </block:actions>

// <block:setup:1>

const labels = [
	'1','2','3','4','5'
]
const data = {
  labels: labels,
  datasets: [
    
    {
      label: 'Dataset 2',
      data: [0,0,0,0,0],
      borderColor: 'blue',
      backgroundColor: 'blue',
      stack: 'combined',
		type:'line'
    },{
      label: 'Dataset 1',
      data: [1,2,3,4,5],
      borderColor: 'rgb(255, 99, 132)',
      backgroundColor: 'rgb(255, 99, 132)',
      stack: 'combined',
      type: 'bar'
    }
  ]
};
// </block:setup>

// <block:config:0>
const config = {
  type: 'line',
  data: data,
  options: {
	responsive:true,
    plugins: {
      title: {
        display: true,
        text: 'Chart.js Stacked Line/Bar Chart'
      }
    },
    scales: {
      y: {
        stacked: true
      }
    }
  },
};
// </block:config>

var myChart2 = new Chart(
	$('#myChart'),
	config
)
