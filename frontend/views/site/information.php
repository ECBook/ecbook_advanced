<?php
/* @var $this yii\web\View */
$this->title = 'My Yii Application';
use common\models;
?>
<div class="site-index">
	<?php
	print ('Hier werden Informationen über den Benutzer '
	.(Yii::$app->user->identity->username).
	' angezeigt');
	?>

    <div class="body-content">

    </div>
</div>
