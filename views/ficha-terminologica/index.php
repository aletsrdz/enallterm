<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\FichaTerminologicaSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Ficha Terminologicas';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="ficha-terminologica-index">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Create Ficha Terminologica', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'area_id',
            'subarea_id',
            'pais_id',
            'temino_origen:ntext',
            //'termino_meta:ntext',
            //'definicion_origen:ntext',
            //'definicion_meta:ntext',
            //'fuente_origen:ntext',
            //'fuente_meta:ntext',
            //'contexto_origen:ntext',
            //'contexto_meta:ntext',
            //'no_recomendado:ntext',
            //'notas_fichat:ntext',
            //'url_imagen:url',
            //'url_video:url',
            //'url_sonido:url',
            //'create_at',
            //'update_at',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>


</div>
