package core;

import kha.Shaders;
import kha.graphics4.FragmentShader;
import kha.graphics4.PipelineState;
import kha.graphics4.VertexData;
import kha.graphics4.VertexStructure;

class ImageShader {
    public var pipeline:PipelineState;

    public function new (fragShader:FragmentShader) {
        final structure = new VertexStructure();
        structure.add('vertexPosition', VertexData.Float32_3X);
        structure.add('vertexUV', VertexData.Float32_2X);
        structure.add('vertexColor', VertexData.UInt8_4X_Normalized);
        pipeline = new PipelineState();
        pipeline.inputLayout = [structure];
        pipeline.vertexShader = Shaders.painter_image_vert;
        pipeline.fragmentShader = fragShader;
        pipeline.compile();
    }
}

function makeBasePipelineShader () {
    return new ImageShader(Shaders.painter_image_frag);
}
