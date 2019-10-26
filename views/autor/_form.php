<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Autor */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="autor-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'ficha_terminologica_id')->textInput() ?>

    <?= $form->field($model, 'user_id')->textInput() ?>

    <?= $form->field($model, 'nombre')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'apaterno')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'amaterno')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'inscrito_id')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
