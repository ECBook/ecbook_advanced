<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Person */
/* @var $form ActiveForm */
?>
<div class="site-index1">

    <?php $form = ActiveForm::begin(); ?>

        <?= $form->field($model, 'p_l_benutzername') ?>
        <?= $form->field($model, 'p_l_passwort') ?>
        <?= $form->field($model, 'bg_id') ?>
    
        <div class="form-group">
            <?= Html::submitButton('Submit', ['class' => 'btn btn-primary']) ?>
        </div>
    <?php ActiveForm::end(); ?>

</div><!-- site-index1 -->
