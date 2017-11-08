<template>
    <div>
        <navbar></navbar>
        <div class="container">
            <div class="col-xs-12 col-md-8 col-md-offset-2 text-center" style="background-color : #fff ; padding : 20px;">
                <h3>Chúc mừng bạn đã vuot qua bài thi</h3>
                <img src="https://www.askideas.com/media/08/Congrats-Graduate-Glitter.gif" />>
                <h4><span style="color : #389BFF">Số điểm của bạn là :</span>
                    <span style="font-weight : bold">{{$route.params.point}}</span></h4>
            </div> 
        </div>
    </div>
</template>

<script>
import Navbar from '../components/general/Navbar'
export default {
    components : {Navbar}
}
</script>

<style>

</style>
