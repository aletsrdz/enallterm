<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\InscritoSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Inscritos';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="inscrito-index">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Create Inscrito', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'user_id',
            'materia_id',
            'grupo_id',
            'equipo_id',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>


</div>
