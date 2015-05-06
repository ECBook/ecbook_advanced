<?php
return [
    'vendorPath' => dirname(dirname(__DIR__)) . '/vendor',
    'components' => [
	
	//Edit URLManager MAYLAS
	 'urlManager' => [
          'showScriptName' => false,
          'enablePrettyUrl' => true
                  ],   
		// 'urlManagerFrontEnd' => [
            // 'class' => 'yii\web\urlManager',
            // 'baseUrl' => '/ecbook_advanced/frontend/web',
			// ],
        'cache' => [
            'class' => 'yii\caching\FileCache',
        ],
    ],
];
