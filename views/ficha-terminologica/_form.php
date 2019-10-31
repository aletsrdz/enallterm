<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use dosamigos\tinymce\TinyMce;
use kartik\file\FileInput;
use kartik\select2\Select2;
use app\models\Paises;
use app\models\Areas;
use app\models\Subareas;
use yii\helpers\ArrayHelper;

/* @var $this yii\web\View */
/* @var $model app\models\FichaTerminologica */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="ficha-terminologica-form">


    <?php $form = ActiveForm::begin(['options'=>['enctype' => 'multipart/form-data']]); ?>

        
  

    <?=
        $form->field($model, 'area_id')->widget(Select2::classname(), [
        'data' => ArrayHelper::map(Areas::find()->all(), 'id', 'nombre'),
        'options' => [
            'placeholder' => 'Seleccione una subarea',
            'onchange'=>'
                    $.post( "../subareas/lists?id='.'"+$(this).val(), function(data){
                            $("select#fichaterminologica-subarea_id").html(data);
                        });'

        ],
        'pluginOptions' => [
            'allowClear' => true
            ],
        ]); 
    ?>    


    <?=
        $form->field($model, 'subarea_id')->widget(Select2::classname(), [
        'data' => ArrayHelper::map(Subareas::find()->all(), 'id', 'nombre'),
        'options' => ['placeholder' => 'Seleccione una subarea'],
        'pluginOptions' => [
            'allowClear' => true
            ],
        ]); 
    ?>

    <?=
        $form->field($model, 'pais_id')->widget(Select2::classname(), [
        'data' => ArrayHelper::map(Paises::find()->all(), 'id', 'nombre'),
        'options' => ['placeholder' => 'Seleccione un país'],
        'pluginOptions' => [
            'allowClear' => true
            ],
        ]); 
    ?>     

    <?= $form->field($model, 'temino_origen')->textarea(['rows' => 2]) ?>

    <?= $form->field($model, 'termino_meta')->textarea(['rows' => 2]) ?>

    
    <?= $form->field($model, 'definicion_origen')->widget(TinyMce::className(), [
    'options' => ['rows' => 6],
    'language' => 'es',
    'clientOptions' => [
        'plugins' => [
            "advlist autolink lists link charmap print preview anchor",
            "searchreplace visualblocks code fullscreen",
            "insertdatetime media table contextmenu paste"
        ],
        'toolbar' => "undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image"
        ]
    ]);?>

    <?= $form->field($model, 'definicion_meta')->widget(TinyMce::className(), [
    'options' => ['rows' => 6],
    'language' => 'es',
    'clientOptions' => [
        'plugins' => [
            "advlist autolink lists link charmap print preview anchor",
            "searchreplace visualblocks code fullscreen",
            "insertdatetime media table contextmenu paste"
        ],
        'toolbar' => "undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image"
    ]
    ]);?>

    <?= $form->field($model, 'fuente_origen')->textarea(['rows' => 2]) ?>

    <?= $form->field($model, 'fuente_meta')->textarea(['rows' => 2]) ?>
    
    <?= $form->field($model, 'contexto_origen')->widget(TinyMce::className(), [
    'options' => ['rows' => 6],
    'language' => 'es',
    'clientOptions' => [
        'plugins' => [
            "advlist autolink lists link charmap print preview anchor",
            "searchreplace visualblocks code fullscreen",
            "insertdatetime media table contextmenu paste"
        ],
        'toolbar' => "undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image"
    ]
    ]);?>    
    
    <?= $form->field($model, 'contexto_meta')->widget(TinyMce::className(), [
    'options' => ['rows' => 6],
    'language' => 'es',
    'clientOptions' => [
        'plugins' => [
            "advlist autolink lists link charmap print preview anchor",
            "searchreplace visualblocks code fullscreen",
            "insertdatetime media table contextmenu paste"
        ],
        'toolbar' => "undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image"
    ]
    ]);?> 

    <?= $form->field($model, 'no_recomendado')->textarea(['rows' => 3]) ?>
    
    <?= $form->field($model, 'notas_fichat')->widget(TinyMce::className(), [
    'options' => ['rows' => 6],
    'language' => 'es',
    'clientOptions' => [
        'plugins' => [
            "advlist autolink lists link charmap print preview anchor",
            "searchreplace visualblocks code fullscreen",
            "insertdatetime media table contextmenu paste"
        ],
        'toolbar' => "undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image"
    ]
    ]);?>     

    
    
    <?= $form->field($model, 'imageFile')->widget(FileInput::classname(), [
    'options' => ['accept' => 'image/*'],
    ]);?>

    <?= $form->field($model, 'url_video')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'url_sonido')->textInput(['maxlength' => true]) ?>


    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
